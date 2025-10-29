const hre = require("hardhat");

async function main() {
  const FinLedger = await hre.ethers.getContractFactory("FinLedger");
  const finLedger = await FinLedger.deploy();
  await finLedger.waitForDeployment();
  console.log(`✅ FinLedger deployed to: ${await finLedger.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
