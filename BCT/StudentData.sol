// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StudentData {
    // Structure to store student details
    struct Student {
        uint rollNo;
        string name;
        uint age;
        string department;
    }

    // Array to store student records
    Student[] public students;

    // Function to add a student
    function addStudent(
        uint _rollNo,
        string memory _name,
        uint _age,
        string memory _department
    ) public {
        students.push(Student(_rollNo, _name, _age, _department));
    }

    // Function to retrieve student details
    function getStudent(
        uint _rollNo
    ) public view returns (uint, string memory, uint, string memory) {
        for (uint i = 0; i < students.length; i++) {
            if (students[i].rollNo == _rollNo) {
                return (
                    students[i].rollNo,
                    students[i].name,
                    students[i].age,
                    students[i].department
                );
            }
        }

        revert("Student not found");
    }

    // Function to receive Ether directly
    receive() external payable {}

    // Fallback function
    fallback() external payable {}
}
