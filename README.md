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
Updated: 2026-04-08T16:53:30.549738+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.967 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.870 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.740 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.771 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.204 | 16 |
| ca-west-1 | 0.427 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.402 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.587 |  |
| us-east-1 | 0.146 | 4457 |
| us-east-2 | 0.149 | 1489 |
| us-gov-east-1 | 0.155 | 1634 |
| us-gov-west-1 | 0.218 | 192 |
| us-west-1 | 0.178 | 3379 |
| us-west-2 | 0.213 | 154 |

