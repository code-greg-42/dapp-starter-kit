const hre = require("hardhat");

async function main() {

  const depositAmount = hre.ethers.utils.parseEther("1");

  const SmartContract = await hre.ethers.getContractFactory("TestContract");
  const contract = await SmartContract.deploy({ value: depositAmount });
  console.log('Deploying contract...');
  await contract.deployed();

  console.log(
    `Contract successfully deployed! Address:${contract.address}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
