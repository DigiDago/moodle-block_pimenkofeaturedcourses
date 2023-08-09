<?php

use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Exception\ExpectationException;

class behat_custom_context extends behat_base
{
    /**
     * @Given the editing mode is enabled
     */
    public function theEditingModeIsEnabled()
    {
        // Turn editing mode on
        $this->execute('behat_general::i_click_on_in_the', array(get_string('turneditingon'), 'link', '#settingsnav .block_tree.box', 'css_element'));
        $this->execute('behat_general::i_wait_until_is_visible', array('#settingsnav .block_tree.box.editing', 'css_element'));
    }

    /**
     * @Given the following courses are created:
     */
    public function theFollowingCoursesAreCreated(TableNode $table)
    {
        foreach ($table as $courseinfo) {
            $shortname = $courseinfo['shortname'] ?? $courseinfo[0];
            $fullname = $courseinfo['fullname'] ?? $shortname;
            $idnumber = $courseinfo['idnumber'] ?? '';

            $this->execute('behat_data_generators::i_create_the_following_courses', array(new TableNode([['shortname', 'fullname', 'idnumber'], [$shortname, $fullname, $idnumber]])));
        }
    }

    /**
     * @Then I should see the :arg1 block
     */
    public function iShouldSeeTheBlock($arg1)
    {
        // Check if the block is visible
        $blockselector = $this->escape($arg1);
        $this->execute('behat_general::should_exist', array($blockselector, 'css_element'));
    }

    /**
 * @Given /^I wait for the element with class "([^"]*)" to be clickable$/
 */
public function iWaitForTheElementWithClassToBeClickable($className)
{
    $this->getSession()->wait(
        10000, // Maximum wait time in milliseconds
        "document.querySelector('.${className}') !== null && document.querySelector('.${className}').offsetParent !== null"
    );
}

    /**
     * @When /^I click on the "([^"]*)" span element$/
     */
    public function iClickOnTheSpanElement($text)
    {
        $element = $this->getSession()->getPage()->find('css', 'span:contains("' . $text . '")');
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not find span: "%s"', $text));
        }
        $element->click();
    }

    /**
     * @Then I should see a modal window with :text
     */
    public function iShouldSeeAModalWindowWith($text)
    {
        $this->getSession()->wait(
            2500,
            "document.querySelector('.modal.show .modal-body').textContent.includes('".$text."')"
        );
    }

    /**
     * @Then the :cssElement css element should not exist
     */
    public function theCssElementShouldNotExist($cssElement)
    {
        $element = $this->getSession()->getPage()->find('css', $cssElement);
        if ($element !== null) {
            throw new \Exception(sprintf('The "%s" css element exists on the page, but it should not.', $cssElement));
        }
    }

    /**
     * @Then the :cssElement css element should contain :text
     */
    public function theCssElementShouldContain($cssElement, $text)
    {
        $element = $this->getSession()->getPage()->find('css', $cssElement);
        if ($element === null) {
            throw new \Exception(sprintf('The "%s" css element does not exist on the page.', $cssElement));
        }

        $elementText = $element->getText();
        if (strpos($elementText, $text) === false) {
            throw new \Exception(sprintf('The "%s" css element does not contain the text "%s".', $cssElement, $text));
        }
    }

}

