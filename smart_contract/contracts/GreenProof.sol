// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract GreenProof {

    struct BigCertificate {
        address supplier;
        address manufacturer; 
        bool isLocallyOwned;  
        bool isRegenerative;  
        bool isFairTrade;   
        uint256 quantity;
        string productName;
        uint128 id; 
    }

    address public chair;

    mapping(address => BigCertificate[]) public supplierCertificates;

    mapping(address => bool) public supplierEligibility;

    mapping(address => BigCertificate[]) public manufacturerCertificates;

    constructor() {
        chair = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == chair, "Only the contract owner can call this function");
        _;
    }

    function grantSupplierIssuingRights(address supplier) public onlyOwner {
        supplierEligibility[supplier] = true;
    }

    function revokeSupplierIssuingRights(address supplier) public onlyOwner {
        supplierEligibility[supplier] = false;
    }

    function isSupplierEligible(address supplier) public view returns (bool) {
        return supplierEligibility[supplier];
    }


    function addCertificate(
    address manufacturer, 
    bool isLocallyOwned, 
    bool isRegenerative, 
    bool isFairTrade, 
    uint256 quantity, 
    string calldata productName,
    uint128 id
    ) public {
        address supplier = msg.sender;
        require(isSupplierEligible(supplier), "Only supplier with rights can issue new certificate.");

        supplierCertificates[supplier].push(BigCertificate(
            supplier, 
            manufacturer, 
            isLocallyOwned, 
            isRegenerative, 
            isFairTrade, 
            quantity, 
            productName,
            id
        ));
    }

    // supplier passes certificate to manufacturer
    function issueCertificateToManufacturer(address manufacturer, uint128 certificateID) external {
        address supplier = msg.sender;
        require(isSupplierEligible(supplier), "Supplier is not eligible to issue certificates");

        // Find certificate by ID
        BigCertificate[] storage certificates = supplierCertificates[supplier];
        BigCertificate memory certificate;
        bool certificateFound = false;
        for (uint i = 0; i < certificates.length; i++) {
            if (certificates[i].id == certificateID) {
                certificate = certificates[i];
                certificateFound = true;
                break;
            }
        }
        require(certificateFound, "Certificate not found for the supplier");

        // Issue certificate to manufacturer
        manufacturerCertificates[manufacturer].push(BigCertificate(
            supplier,
            manufacturer,
            certificate.isLocallyOwned,
            certificate.isRegenerative,
            certificate.isFairTrade,
            certificate.quantity,
            certificate.productName,
            certificate.id
        ));
    }

    function produceProductFrom(uint128 _certificateId) external {
        BigCertificate[] storage certificates = manufacturerCertificates[msg.sender];
        require(certificates.length > 0, "Manufacturer does not any certificates that can be used for manufacturing.");
        for (uint i = 0; i < certificates.length; i++) {
            if (certificates[i].id == _certificateId && certificates[i].quantity > 0) {
            certificates[i].quantity--;
            break;
            }
        }
    }

}