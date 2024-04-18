// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract P2PLending {
    struct Loan {
        address borrower;
        uint256 amount;
        uint256 interestRate;
        uint256 duration;
        uint256 repaymentAmount;
        uint256 repaymentDeadline;
        bool funded;
        bool repaid;
    }
    
    mapping(address => uint256) public balances;
    mapping(address => Loan[]) public loans;

    event LoanRequested(address indexed borrower, uint256 amount);
    event LoanFunded(address indexed lender, address indexed borrower, uint256 amount);
    event LoanRepaid(address indexed borrower, uint256 amount);
    
    function requestLoan(uint256 _amount, uint256 _interestRate, uint256 _duration) external {
        // Check if borrower has enough collateral or reputation
        // For simplicity, we skip these checks
        Loan memory newLoan = Loan({
            borrower: msg.sender,
            amount: _amount,
            interestRate: _interestRate,
            duration: _duration,
            repaymentAmount: _amount + (_amount * _interestRate / 100),
            repaymentDeadline: block.timestamp + _duration * 1 days,
            funded: false,
            repaid: false
        });
        loans[msg.sender].push(newLoan);
        emit LoanRequested(msg.sender, _amount);
    }

    function fundLoan(address _borrower, uint256 _index) external payable {
        Loan storage loan = loans[_borrower][_index];
        require(!loan.funded, "Loan already funded");
        require(msg.value >= loan.amount, "Insufficient funds");
        loan.funded = true;
        balances[_borrower] += msg.value;
        emit LoanFunded(msg.sender, _borrower, msg.value);
    }

   function repayLoan(uint256 _index) external payable {
    Loan storage loan = loans[msg.sender][_index];
    require(loan.funded, "Loan not funded yet");
    require(!loan.repaid, "Loan already repaid");
    require(msg.value >= loan.repaymentAmount, "Insufficient repayment amount");
    loan.repaid = true;
    // Subtract the repayment amount
    require(balances[msg.sender] >= loan.repaymentAmount, "Insufficient balance");
    balances[msg.sender] -= loan.repaymentAmount;
    emit LoanRepaid(msg.sender, loan.repaymentAmount);
}



}
