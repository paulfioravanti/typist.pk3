/* Copyright Alexander 'm8f' Kromm (mmaulwurff@gmail.com) 2019
 *
 * This file is a part of Typist.pk3.
 *
 * Typist.pk3 is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 *
 * Typist.pk3 is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Typist.pk3.  If not, see <https://www.gnu.org/licenses/>.
 */

/** This class contains tests that can be run independently of GZDoom being
 * able to tick.
 */
class tt_Test : tt_Clematis
{

// public: // tt_Clematis //////////////////////////////////////////////////////

  override
  void TestSuites()
  {
    testTargetWidget();
    testTargetRegistry();
    testSelectedDifficulty();
    testRandomNumberSource();
    testPlayerInput();
    testAutoModeSource();
    testTargetWidgetRegistry();

    testPlayerPawnSource();
    testPawnOriginSource();
    testTargetRadar();
    testDeathReporter();
    testQuestionAnswerDamager();
    testPlayerInfoSourceImpl();

    Console.Printf("zscript/typist/tests/tt_test.zs:44: T: Testing finished.");
  }

// private: //////////////////////////////////////////////////////////////////

  private play
  Actor Spawn(class<Actor> type, vector3 pos) const
  {
    return Actor.Spawn(type, pos);
  }

  private play
  void Kill(Actor a) const
  {
    a.A_Die();
  }

} // tt_Test
