pragma solidity ^0.8.22;

// SPDX-License-Identifier: MIT

contract Jokenpo {
    enum Possibilidades {Pedra, Papel, Tesoura}

    mapping(address => uint256[]) public maoJogador1;
    mapping(address => uint256[]) public maoJogador2;

    event PartidaFeita(address indexed _jogador, uint256 _possibilidades);

    function partida (Possibilidades _possibilidades, address _jogador) public {
        if (_jogador == msg.sender) {
            if (_possibilidades != Possibilidades(0)) {
                maoJogador1[_jogador].push(uint256(_possibilidades));
                emit PartidaFeita(msg.sender, uint8(_possibilidades));
            }
        } else if (_jogador == address(this)) {
            maoJogador2[msg.sender].push(uint256(_possibilidades));
            emit PartidaFeita(msg.sender, uint8(_possibilidades));
        }
    }

    function verMao() public view returns (uint256[] memory) {
        return maoJogador1[msg.sender];
    }

}
