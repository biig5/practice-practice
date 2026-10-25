#!/bin/bash
SOURCE=$1
BACKUP_ROOT=${2:-./backups}

if [ -z "${SOURCE}" ]; then
    echo "Error: No argument is found!" >&2
    echo "Usage: $0 <source>" >&2
    exit 1
fi

echo "Source: ${SOURCE}"
echo "Backup root: ${BACKUP_ROOT}"

check_dir() {
    if [ ! -d "${SOURCE}" ]; then
        echo "Error: This is not a directory" >&2
        echo "Usage: $0 <source_dir> [backup_dir]" >&2
        exit 1
    fi
}

check_dir

SOURCE_NAME=$(basename "${SOURCE}")
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="${SOURCE_NAME}_${TIMESTAMP}"
BACKUP_PATH="${BACKUP_ROOT}/${BACKUP_NAME}"

    echo "Backup will go to: ${BACKUP_PATH}"

if ! mkdir -p "${BACKUP_PATH}"; then
    echo "Error: Could not create backup folder: ${BACKUP_PATH}" >&2
    exit 1
fi

if ! cp -r  "${SOURCE}/." "${BACKUP_PATH}"; then
    echo "Error: Could not copy file from ${SOURCE}" >&2
    rmdir "${BACKUP_PATH}"
    exit 1
fi

ITEM_COUNT=$(ls -A "${BACKUP_PATH}" | wc -l)

echo "Backup complete"
echo "Location: ${BACKUP_PATH}"
echo "Top-level items: ${ITEM_COUNT}"
