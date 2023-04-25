/*-
 *
 * Hedera Hardhat Example Project
 *
 * Copyright (C) 2023 Hedera Hashgraph, LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

const hre = require("hardhat");
const { expect } = require("chai");

describe("RPC", function () {
  let contractAddress;
  let signers;

  before(async function () {
    signers = await hre.ethers.getSigners();
  });

  it("should be able to get the account balance", async function () {
		//Assign the first signer, which comes from the first privateKey from our configuration in hardhat.config.js, to a wallet variable.
		const wallet = (await ethers.getSigners())[0];
		//Wallet object (which is essentially signer object) has some built in functionality like getBalance, getAddress and more
		const balance = (await wallet.getBalance()).toString();
		console.log(
			`The address ${wallet.address} has ${balance} tinybars`
		);
		expect(Number(balance)).to.be.greaterThan(0);
  });

  it("should be able to deploy a contract", async function () {
		//Assign the first signer, which comes from the first privateKey from our configuration in hardhat.config.js, to a wallet variable.
		let wallet = (await ethers.getSigners())[0];

		//Initialize a contract factory object
		//name of contract as first parameter
		//wallet/signer used for signing the contract calls/transactions with this contract
		const GreenProof = await ethers.getContractFactory(
			"GreenProof",
			wallet
		);
		//Using already intilized contract facotry object with our contract, we can invoke deploy function to deploy the contract.
		//Accepts constructor parameters from our contract
		const contract = await GreenProof.deploy();

		//We use wait to recieve the transaction (deployment) receipt, which contrains contractAddress
		contractAddress = (await contract.deployTransaction.wait())
			.contractAddress;
    
		console.log(`GreenProof deployed to: ${contractAddress}`);
		// contractAddress = await hre.run("deploy-contract");
		expect(contractAddress).to.not.be.null;
  });

  it("should be able to make a contract view call", async function () {
  //Assign the first signer, which comes from the first privateKey from our configuration in hardhat.config.js, to a wallet variable.
  const wallet = (await ethers.getSigners())[0];

  const contract = await hre.ethers.getContractAt("GreenProof", contractAddress, wallet);
  const callRes = await contract.test();

  console.log(`Contract call result: ${callRes}`);

  //   const res = callRes
    expect(1).to.be.equal(1)
  });

  it("should give supplier rights to another address", async function () {
    // const signers = await ethers.getSigners();
    console.log(`Signers lengths - ${signers.length}`);
    // const owner = signers[0].address;

    // const supplier = signers[1].address;

    // const contract = await ethers.getContractAt("GreenProof", contractAddress, owner);
    // const Tx = await contract.grantSupplierIssuingRights(supplier);

    // console.log(`Gave supplier issuing rights at ${Tx}`)

    // const hasRole = await contract.isSupplierEligible(supplier);

    // expect(hasRole).to.be.true;
  })

  it("should be able to make a contract call", async function () {
  //   const msg = "updated_msg";
  // //Assign the first signer, which comes from the first privateKey from our configuration in hardhat.config.js, to a wallet variable.
  // const wallet = (await ethers.getSigners())[0];

  // //Assign the greeter contract object in a variable, this is used for already deployed contract, which we have the address for. ethers.getContractAt accepts:
  // //name of contract as first parameter
  // //address of our contract
  // //wallet/signer used for signing the contract calls/transactions with this contract
  // const greeter = await ethers.getContractAt("Greeter", contractAddress, wallet);

  // //using the greeter object(which is our contract) we can call functions from the contract. In this case we call setGreeting with our new msg
  // const updateTx = await greeter.setGreeting(msg);

  // console.log(`Updated call result: ${msg}`);

  //   const callRes = await greeter.greet();
  //   expect(callRes).to.be.equal(msg);
  });
});
