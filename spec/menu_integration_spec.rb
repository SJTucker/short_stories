require_relative 'spec_helper'

describe "Menu Integration" do
  let(:menu_text) do
<<EOS
How would you like to search for short stories?
1. See a list of all stories
2. Search by Genre
3. Search by Title
4. Search by Author
5. Search by Decade
EOS
  end
  context "the menu displays on startup" do
    let(:shell_output){run_short_stories_with_input() }
    it "should print the menu" do
      shell_output.should include(menu_text)
    end
  end
  context "the user selects 1" do
    let(:shell_output){ run_short_stories_with_input("1") }
    it "should print the next menu" do
      shell_output.should include("What story would you like to read?")
    end
  end
  context "the user selects 2" do
    let(:shell_output){ run_short_stories_with_input("2") }
    it "should print the next menu" do
      shell_output.should include("What is the genre you would like to search?")
    end
  end
  context "the user selects 3" do
    let(:shell_output){ run_short_stories_with_input("3") }
    it "should print the next menu" do
      shell_output.should include("What is the title you would like to search?")
    end
  end
  context "the user selects 4" do
    let(:shell_output){ run_short_stories_with_input("4") }
    it "should print the next menu" do
      shell_output.should include("What is the name of the author you would like to search?")
    end
  end
  context "the user selects 5" do
    let(:shell_output){ run_short_stories_with_input("5") }
    it "should print the next menu" do
      shell_output.should include("What is the decade you would like to search?")
    end
  end
  context "the user inputs an incorrect selection" do
    let(:shell_output){ run_short_stories_with_input("6") }
    it "should print the menu again" do
      shell_output.should include_in_order(menu_text, '6', menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'6' is an invalid option. Try again.")
    end
  end
  context "if the user gives no input" do
    let(:shell_output){ run_short_stories_with_input("") }
    it "should print the menu again" do
      shell_output.should include_in_order(menu_text, menu_text)
    end
    it "should include an appropriate error message" do
      shell_output.should include("'' is an invalid option")
    end
  end
  context "if the user types in the wrong input, it should allow them to try again" do
    let(:shell_output){ run_short_stories_with_input("6", "3") }
    it "should include the appropriate menu" do
      shell_output.should include("What is the title you would like to search?")
    end
  end
  context "if the user types in incorrect input multiple times, they should be allowed to try again" do
    let(:shell_output){ run_short_stories_with_input("6", "", "1") }
    it "should include the appropriate menu" do
      shell_output.should include("What story would you like to read?")
    end
  end
end
