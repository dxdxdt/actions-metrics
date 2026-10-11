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
Updated: 2026-10-11T13:41:13.323741+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.715 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.990 |  |
| ap-southeast-1 | 0.798 |  |
| ap-southeast-2 | 0.697 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.739 |  |
| ap-southeast-5 | 0.813 |  |
| ap-southeast-6 | 0.778 |  |
| ap-southeast-7 | 0.894 |  |
| ca-central-1 | 0.147 | 18 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.463 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.494 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.822 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.186 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.127 | 5143 |
| us-east-2 | 0.119 | 1694 |
| us-gov-east-1 | 0.114 | 1938 |
| us-gov-west-1 | 0.213 | 237 |
| us-west-1 | 0.155 | 4166 |
| us-west-2 | 0.211 | 194 |

