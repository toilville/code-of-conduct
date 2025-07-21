# Release Guide

This guide explains how to create releases for the Code of Conduct repository.

## 🚀 **Release Process Overview**

The repository uses automated releases through GitHub Actions. There are two ways to create a release:

### **Method 1: Git Tag (Recommended)**
```bash
# 1. Update CHANGELOG.md with new version
# 2. Commit the changes
git add CHANGELOG.md
git commit -m "Prepare release v1.3.0"

# 3. Create and push tag
git tag -a v1.3.0 -m "Release v1.3.0: Description of changes"
git push origin v1.3.0
```

### **Method 2: Manual Trigger**
1. Go to GitHub → Actions → Release workflow
2. Click "Run workflow"
3. Enter the version (e.g., v1.3.0)
4. Click "Run workflow"

## 📋 **Pre-Release Checklist**

Before creating a release:

- [ ] **Update CHANGELOG.md** with new version entry
- [ ] **Test all documentation links** (automated via CI)
- [ ] **Review all templates** for accuracy and completeness
- [ ] **Update version in package.json** if applicable
- [ ] **Verify contact information** is current
- [ ] **Check that all PRs** are merged and issues resolved
- [ ] **Run local validation**: `npm run validate` (if dependencies installed)

## 📝 **CHANGELOG.md Format**

When adding a new version to CHANGELOG.md:

```markdown
## [1.3.0] - 2025-07-21

### Added
- New feature or template added
- New documentation or guide

### Changed
- Existing feature improved
- Documentation updated

### Fixed
- Bug fixes
- Corrected information

### Removed
- Deprecated features removed
```

## 🎯 **Version Numbering**

This project follows [Semantic Versioning](https://semver.org/):

- **MAJOR** (x.0.0): Breaking changes, major overhauls
- **MINOR** (1.x.0): New features, templates, or significant improvements
- **PATCH** (1.1.x): Bug fixes, small corrections, clarifications

### **Examples:**
- `v1.2.0` → `v1.3.0`: Added new enforcement template
- `v1.2.0` → `v1.2.1`: Fixed typo in Code of Conduct
- `v1.2.0` → `v2.0.0`: Complete restructure of templates

## 📦 **What Gets Released**

Each release automatically creates:

### **GitHub Release Page:**
- Release notes extracted from CHANGELOG.md
- Links to download assets
- Git tag and commit information

### **Release Assets:**
1. **ZIP Archive**: `code-of-conduct-template-v1.3.0.zip`
   - All essential files for easy download
2. **TAR.GZ Archive**: `code-of-conduct-template-v1.3.0.tar.gz`
   - Unix/Linux compatible format
3. **Individual CODE_OF_CONDUCT.md**: For quick access

### **Included Files:**
- `CODE_OF_CONDUCT.md`
- `CONTRIBUTING.md`
- `ENFORCEMENT_GUIDELINES.md`
- `VIOLATION_REPORT_TEMPLATE.md`
- `QUICK_START.md`
- `README.md`
- `LICENSE`
- `CHANGELOG.md`

## 🔧 **Release Automation Features**

The release workflow automatically:

- ✅ **Extracts release notes** from CHANGELOG.md
- ✅ **Creates distribution archives** (ZIP and TAR.GZ)
- ✅ **Uploads multiple asset formats** for different users
- ✅ **Handles both tagged and manual releases**
- ✅ **Generates professional release pages**

## 🎯 **Release Strategy**

### **Regular Releases:**
- **Monthly**: Bug fixes and small improvements (patch releases)
- **Quarterly**: New features and templates (minor releases)
- **Annually**: Major overhauls or restructuring (major releases)

### **Emergency Releases:**
- Security issues in templates
- Critical errors in documentation
- Broken contact information

## 📊 **Post-Release Tasks**

After creating a release:

1. **Announce on social media** (if significant release)
2. **Update any external documentation** that references the repository
3. **Notify communities** that use the templates
4. **Monitor for feedback** and issues
5. **Plan next release** based on community needs

## 🔍 **Release Verification**

To verify a release was successful:

1. **Check GitHub Releases page**: Should show new release with assets
2. **Download assets**: Verify they contain correct files
3. **Test release notes**: Ensure they're properly formatted
4. **Verify version badges**: Should update automatically in README

## 🆘 **Troubleshooting Releases**

### **Release Failed:**
- Check GitHub Actions logs for errors
- Verify CHANGELOG.md format is correct
- Ensure all required files exist

### **Missing Assets:**
- Re-run the release workflow manually
- Check file paths in workflow configuration

### **Wrong Release Notes:**
- Edit the release on GitHub manually
- Fix CHANGELOG.md format for future releases

## 📞 **Release Support**

For questions about releases:
- 📧 Email: hello@itstoilville.com
- 🐛 Issues: [GitHub Issues](https://github.com/toilville/code-of-conduct/issues)
- 📖 Documentation: Check workflow files in `.github/workflows/`

## 🎉 **Example Release Command**

Complete example for v1.3.0 release:

```bash
# 1. Update CHANGELOG.md (edit the file)
vim CHANGELOG.md

# 2. Commit changes
git add CHANGELOG.md
git commit -m "Prepare release v1.3.0

- Updated CHANGELOG.md with new features
- Ready for v1.3.0 release"

# 3. Create and push tag
git tag -a v1.3.0 -m "Release v1.3.0: Enhanced enforcement templates and improved documentation"
git push origin v1.3.0

# 4. Verify release
# Check GitHub → Releases page in ~2-3 minutes
```

---

*Automated releases make distribution easy and professional. Need help? Contact the Toilville team!*
