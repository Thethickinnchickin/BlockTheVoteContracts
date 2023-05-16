// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const {ethers} = require("hardhat");
const { VotingNFT_Contract_Address } = require("../constants");

async function main() {
  // Now deploy the CryptoDevsDAO contract
  const VotersDAO = await ethers.getContractFactory("VotersDAO");
  const votersDAO = await VotersDAO.deploy(
    VotingNFT_Contract_Address,
    {
      // This assumes your metamask account has at least 1 ETH in its account
      // Change this value as you want
      value: ethers.utils.parseEther(".01"),
    }
  );
  await votersDAO.deployed();

  console.log("CryptoDevsDAO deployed to: ", votersDAO.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
