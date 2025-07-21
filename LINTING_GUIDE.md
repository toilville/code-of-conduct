# Enhanced Linting and Quality Assurance Guide

This repository uses a comprehensive linking and quality assurance setup that
goes beyond basic Markdown linking to include style guide compliance, bias
detection, and accessibility checking.

## 🛠️ Tools Overview

### Core Linting Tools

1. **markdownlint-cli** - Basic Markdown formatting and structure
2. **Alex** - Inclusive language and bias detection
3. **textlint** - Writing style, grammar, and accessibility
4. **markdown-link-check** - Link validation

### Style Guides Supported

- **Chicago Manual of Style** elements via textlint rules
- **Plain Language** guidelines via write-good rule
- **Inclusive Language** standards via Alex
- **Technical Writing** best practices via terminology rule

## 📋 Available Commands

### Local Development

```bash
# Basic markdown linting
npm run lint

# Auto-fix basic issues
npm run lint:fix

# Check for biased/non-inclusive language
npm run lint:style

# Check writing style and accessibility
npm run lint:accessibility

# Run all linting checks
npm run lint:all

# Complete validation (linting + link checking)
npm run validate

# Check all markdown files for broken links
npm run link-check:all
```

## ⚙️ Configuration Files

### `.markdownlint.json`

Basic Markdown structure and formatting rules:

- Line length limits (80 chars, excluding code/tables)
- Heading structure
- List formatting
- Code block style

### `.alexrc.json`

Inclusive language configuration:

- Allowed terms (context-specific exceptions)
- Bias detection sensitivity
- Community-specific language preferences

### `.textlintrc.json`

Advanced writing quality checks:

- Grammar and style (write-good)
- Terminology consistency
- Capitalization rules
- Common misspellings

### `.dictionary.txt`

Custom word list for:

- Brand names (GitHub, Toilville, etc.)
- Technical terms
- Project-specific vocabulary
- Community terminology

## 🚀 GitHub Actions Integration

### Recommended Approach: Hybrid Local + CI

**Local Development:**

- Run `npm run lint:all` before committing
- Use `npm run lint:fix` for quick fixes
- Address style/bias suggestions iteratively

**GitHub Actions Benefits:**

- Consistent environment across contributors
- Automated PR feedback
- Historical tracking of quality metrics
- Integration with security scanning

### Enhanced Quality Workflow

The `.github/workflows/enhanced-quality.yml` provides:

1. **Markdown Linting** - Structure and formatting
2. **Style Guide Checks** - Writing quality and consistency  
3. **Inclusive Language** - Bias detection and community standards
4. **Link Validation** - Broken link detection
5. **Security Scanning** - Dependency and code security
6. **Comprehensive Reports** - Quality metrics and trends

## 📊 Advanced Features

### Chicago Manual of Style Elements

Implemented via textlint rules:

- Proper capitalization in headings
- Consistent terminology usage
- Appropriate punctuation
- Clear, concise writing

### Bias and Hate Speech Detection

Alex tool configuration:

- Identifies potentially exclusionary language
- Suggests inclusive alternatives
- Configurable for community context
- Integrates with PR review process

### Accessibility Guidelines

Textlint accessibility rules:

- Plain language recommendations
- Readability improvements
- Clear structure requirements
- Alternative text suggestions

## 🎯 Best Practices

### For Contributors

1. **Before Committing:**

   ```bash
   npm run lint:all
   npm run validate
   ```

2. **Writing Guidelines:**
   - Use inclusive, welcoming language
   - Keep sentences clear and concise
   - Maintain consistent terminology
   - Structure content logically

3. **Error Resolution:**
   - Address Markdown linting first (structural issues)
   - Review style suggestions for readability
   - Consider inclusive language alternatives
   - Verify all links work

### For Maintainers

1. **PR Review Process:**
   - Check automated quality reports
   - Review style and bias feedback
   - Ensure accessibility standards
   - Validate documentation structure

2. **Quality Monitoring:**
   - Review quality reports regularly
   - Update linting rules as needed
   - Maintain custom dictionary
   - Track improvement trends

## 🔧 Customization

### Adding Brand Names

Edit `.dictionary.txt`:

```
# Add new brand/technical terms
YourBrandName
newtechterm
acronym
```

### Adjusting Style Rules

Edit `.textlintrc.json`:

```json
{
  "rules": {
    "terminology": {
      "terms": {
        "your-term": "Your Preferred Format"
      }
    }
  }
}
```

### Inclusive Language Settings

Edit `.alexrc.json`:

```json
{
  "allow": ["context-specific-term"],
  "deny": ["problematic-term"]
}
```

## 📈 Performance Considerations

### Local vs. CI Recommendations

**Local (Recommended):**

- Fast feedback during development
- Iterative improvement process
- Developer learning and awareness
- Reduced CI/CD resource usage

**CI/CD (Supplementary):**

- Consistency enforcement
- Historical tracking
- Team collaboration
- Automated reporting

### Optimization Tips

1. **Focus Areas by Priority:**
   - Markdown structure (critical)
   - Inclusive language (high priority)
   - Style consistency (medium priority)
   - Advanced grammar (nice-to-have)

2. **Incremental Adoption:**
   - Start with basic Markdown formatting
   - Add inclusive language checking
   - Introduce style guidelines
   - Expand to accessibility features

## 🆘 Troubleshooting

### Common Issues

**False Positives:**

- Add terms to `.dictionary.txt`
- Configure tool-specific exceptions
- Use inline disable comments sparingly

**Performance:**

- Run specific linters rather than full suite
- Use `.gitignore` patterns to exclude large files
- Consider CI-only for comprehensive checks

**Integration:**

- Ensure Node.js version compatibility
- Update dependencies regularly
- Test configuration changes locally

## 🔗 Resources

- [markdownlint Rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)
- [Alex Documentation](https://alexjs.com/)
- [textlint Rules](https://textlint.github.io/docs/getting-started.html)
- [Chicago Manual of Style](https://www.chicagomanualofstyle.org/)
- [Plain Language Guidelines](https://www.plainlanguage.gov/)
- [Web Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)

---

This enhanced linting setup ensures our documentation maintains high standards
for clarity, inclusivity, and accessibility while supporting contributors with
helpful feedback and automated quality assurance.
