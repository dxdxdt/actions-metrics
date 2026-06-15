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
Updated: 2026-06-15T12:59:55.604191+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.601 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.598 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.628 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.668 |  |
| ap-southeast-5 | 0.759 |  |
| ap-southeast-6 | 0.657 |  |
| ap-southeast-7 | 0.848 |  |
| ca-central-1 | 0.249 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.543 |  |
| eu-central-2 | 0.576 |  |
| eu-north-1 | 0.604 |  |
| eu-south-1 | 0.591 |  |
| eu-south-2 | 0.581 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.506 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.714 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.653 |  |
| us-east-1 | 0.214 | 4759 |
| us-east-2 | 0.181 | 1634 |
| us-gov-east-1 | 0.191 | 1713 |
| us-gov-west-1 | 0.149 | 198 |
| us-west-1 | 0.094 | 3668 |
| us-west-2 | 0.151 | 163 |

