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
Updated: 2026-05-16T18:54:12.128769+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.709 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.532 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.557 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.782 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.844 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.801 |  |
| ap-southeast-6 | 0.760 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.213 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.502 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.459 |  |
| eu-west-3 | 0.478 |  |
| il-central-1 | 0.646 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.601 |  |
| us-east-1 | 0.166 | 4649 |
| us-east-2 | 0.161 | 1596 |
| us-gov-east-1 | 0.169 | 1694 |
| us-gov-west-1 | 0.204 | 195 |
| us-west-1 | 0.149 | 3569 |
| us-west-2 | 0.204 | 158 |

