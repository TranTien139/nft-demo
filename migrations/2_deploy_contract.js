const Nft = artifacts.require("Nft");

module.exports = async function(deployer) {
	await deployer.deploy(Nft);
};
