package be.kdg.yahtzee;

public class TestAll {
    public static void main(String args[]) {
      org.junit.runner.JUnitCore.main(
              "be.kdg.yahtzee.game.TestChat",
              "be.kdg.yahtzee.game.TestScore",
              "be.kdg.yahtzee.game.TestGame",
              "be.kdg.yahtzee.game.TestNewGame",
              "be.kdg.yahtzee.game.TestGameRoom",
              "be.kdg.yahtzee.users.TestChangePassword",
              "be.kdg.yahtzee.users.TestChangeProfile",
              "be.kdg.yahtzee.users.TestLogin",
              "be.kdg.yahtzee.users.TestRegistratieUser");
    }
}

