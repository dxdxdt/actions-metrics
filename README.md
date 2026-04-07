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
Updated: 2026-04-07T18:53:36.284171+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.568 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.785 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.941 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.517 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.819 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.112 | 4454 |
| us-east-2 | 0.123 | 1489 |
| us-gov-east-1 | 0.124 | 1632 |
| us-gov-west-1 | 0.267 | 191 |
| us-west-1 | 0.203 | 3371 |
| us-west-2 | 0.256 | 154 |

