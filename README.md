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
Updated: 2026-04-22T17:55:06.143937+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.929 |  |
| ap-east-1 | 0.778 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.578 |  |
| ap-northeast-2 | 0.684 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.986 |  |
| ap-southeast-1 | 0.833 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.151 | 16 |
| ca-west-1 | 0.264 |  |
| eu-central-1 | 0.440 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.473 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.538 |  |
| us-east-1 | 0.102 | 4543 |
| us-east-2 | 0.120 | 1524 |
| us-gov-east-1 | 0.123 | 1661 |
| us-gov-west-1 | 0.264 | 194 |
| us-west-1 | 0.223 | 3459 |
| us-west-2 | 0.262 | 157 |

