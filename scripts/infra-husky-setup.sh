# INFRA FOLDER SETUP:

echo "INFRA SETUP:"

# Set hooksPath
git config core.hooksPath .husky

EXPECTED_OUTPUT=".husky"
ACTUAL_OUTPUT=$(git config --get core.hooksPath)

echo "Output should be $EXPECTED_OUTPUT, output: $ACTUAL_OUTPUT"

if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "Infra Script Passed!"
else
    echo "Infra Script Failed!"
    exit 1
fi
echo ""