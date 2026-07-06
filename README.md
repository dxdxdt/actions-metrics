# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-07-06T20:48:35.711505+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.723 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.797 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.525 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.885 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.596 |  |
| us-east-1 | 0.146 | 4828 |
| us-east-2 | 0.122 | 1655 |
| us-gov-east-1 | 0.126 | 1729 |
| us-gov-west-1 | 0.214 | 201 |
| us-west-1 | 0.157 | 3749 |
| us-west-2 | 0.220 | 164 |

