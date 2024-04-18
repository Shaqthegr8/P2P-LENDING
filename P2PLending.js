const { expect } = require("chai");

describe("P2PLending", function () {
  let P2PLending;
  let p2pLending;
  let owner;
  let addr1;
  let addr2;
  let addrs;

  beforeEach(async function () {
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();
    P2PLending = await ethers.getContractFactory("P2PLending");
    p2pLending = await P2PLending.deploy();
  });

  it("Should request a loan", async function () {
    await p2pLending.requestLoan(100, 5, 30);
    const loans = await p2pLending.loans(owner.address);
    // Check the length of the loans array
    expect(loans.length).to.equal(1);
    // Access the first loan and check its properties
    expect(loans[0].amount).to.equal(100);
    expect(loans[0].interestRate).to.equal(5);
    expect(loans[0].duration).to.equal(30);
  });
  
  it("Should fund a loan", async function () {
    await p2pLending.requestLoan(100, 5, 30);
    // Get the loans of the owner
    const loans = await p2pLending.loans(owner.address);
    // Fund the first loan
    await p2pLending.fundLoan(owner.address, 0, { value: 100 });
    // Check if the loan is funded
    const fundedLoan = await p2pLending.loans(owner.address);
    expect(fundedLoan[0].funded).to.equal(true);
  });
  
  

  it("Should repay a loan", async function () {
    await p2pLending.requestLoan(100, 5, 30);
    await p2pLending.fundLoan(owner.address, 0, { value: 100 });
    await p2pLending.repayLoan(0, { value: 105 }); // Repay the loan with interest
    const loan = await p2pLending.loans(owner.address, 0);
    expect(loan.repaid).to.equal(true);
  });
});
