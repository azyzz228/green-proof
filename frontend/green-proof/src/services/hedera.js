import {
	AccountId,
	Client,
	ContractCallQuery,
	ContractExecuteTransaction,
	ContractFunctionParameters,
	ContractInfoQuery,
	PrivateKey,
} from "@hashgraph/sdk";
import { config } from "dotenv";

const contractId = "0.0.4344183";

const operatorId = AccountId.fromString("0.0.4281457");
const operatorKey = PrivateKey.fromString(
	"302e020100300506032b657004220420e8f9800d33bcf3e0102b1baed486eb40167f648c222e8f3b7a07b7812a179c27"
);
const client = Client.forTestnet().setOperator(operatorId, operatorKey);

const MANUFACTURER = "0xA9491678df337139B45BE29448c3801be9D9C1d1";
const SUPPLIER = "0x9f150Cdc0d10de781fca0f567Bb68bE80c16B7Eb";

export async function test() {
	const contractQueryTx = new ContractCallQuery()
		.setContractId(contractId)
		.setGas(100000)
		.setFunction("test");

	const contractQuerySubmit = await contractQueryTx.execute(client);
	const res = contractQuerySubmit.getAddress(0);
	console.log(res);
	console.log(`function Test result -- ${res}`);
}

export async function getChair() {
	const query = new ContractCallQuery()
		.setContractId(contractId)
		.setGas(100000)
		.setFunction("chair");

	const res = await query.execute(client);
	console.log(res.getAddress(0));
	console.log(`res - ${res}`);
}

export async function grantSupplierIssuingRights() {
	//Contract call query
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(60000)
		.setFunction(
			"grantSupplierIssuingRights",
			new ContractFunctionParameters().addAddress('0x0000000000000000000000000000000000415471') // supplier address from MM
		);

	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const receipt = await txResponse.getReceipt(client);
	console.log(receipt);
	console.log(receipt.status);
	// Get the function value
}

// export async function grantSupplierIssuingRights(_to) {
// 	//Contract call query
// 	const query = new ContractExecuteTransaction()
// 		.setContractId(contractId)
// 		.setGas(60000)
// 		.setFunction(
// 			"grantSupplierIssuingRights",
// 			new ContractFunctionParameters().addAddress(
//                 _to
// 			) // supplier address from MM
// 		);

// 	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
// 	const txResponse = await query.execute(client);
//     const receipt = await txResponse.getReceipt(client);
//     console.log(receipt.status);
// 	// Get the function value
// }

export async function addCertificate() {
	//Contract call query
	console.log("Calling addCertificate function");
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(9000000)
		.setFunction(
			"addCertificate",
			new ContractFunctionParameters()
				.addAddress(MANUFACTURER)
				.addBool(true)
				.addBool(true)
				.addBool(true)
				.addUint256(33)
				.addString("apples")
				.addUint128(1) // supplier address from MM
		);

	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const receipt = await txResponse.getReceipt(client);
	console.log(receipt);
}

export async function issueCertificateToManufacturer() {
	console.log("Calling issueCertificateToManufacturer function");
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(9000000)
		.setFunction(
			"issueCertificateToManufacturer",
			new ContractFunctionParameters()
				.addAddress(MANUFACTURER)
				.addUint128(1) // supplier address from MM
		);
	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
	const receipt = await txResponse.getReceipt(client);
	console.log(receipt);
    
}

export async function produceProductFrom() {
	console.log("Calling produceProductFrom function");
	const query = new ContractExecuteTransaction()
		.setContractId(contractId)
		.setGas(9000000)
		.setFunction(
			"produceProductFrom",
			new ContractFunctionParameters()
				.addUint128(1) // supplier address from MM
		);
	//Sign with the client operator private key to pay for the query and submit the query to a Hedera network
	const txResponse = await query.execute(client);
    const res = txResponse.transactionHash;
	const receipt = await txResponse.getReceipt(client);
    console.log(res);
	console.log(receipt);
    
}

async function main() {
	// const q = AccountId.fromEvmPublicAddress("0x9f150Cdc0d10de781fca0f567Bb68bE80c16B7Eb")

	// // console.log(q);
	// console.log(operatorId.toSolidityAddress());

	//Create the query
	const query = new ContractInfoQuery().setContractId(contractId);

	//Sign the query with the client operator private key and submit to a Hedera network
	const info = await query.execute(client);

	console.log(info);
}

// main();
// test();
// getChair();
// grantSupplierIssuingRights();
// addCertificate();
// issueCertificateToManufacturer();
produceProductFrom();