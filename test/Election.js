const { assert } = require("chai");
const _deploy_contracts = require("../migrations/2_deploy_contracts");

var Election = artifacts.require("./Election.sol");

contract("Election", (accounts) => {
  console.log("accounts-", accounts);
  it("initializes with 2 candidates", function () {
    return Election.deployed()
      .then((instance) => {
        return instance.candidatesCount();
      })
      .then((count) => {
        assert.equal(count, 2);
      });
  });
});
