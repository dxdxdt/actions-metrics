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
Updated: 2026-04-20T11:14:55.417683+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.019 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.627 |  |
| ap-northeast-1 | 0.509 |  |
| ap-northeast-2 | 0.619 |  |
| ap-northeast-3 | 0.532 |  |
| ap-south-1 | 0.902 |  |
| ap-south-2 | 0.901 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.650 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.712 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.186 | 4530 |
| us-east-2 | 0.158 | 1518 |
| us-gov-east-1 | 0.168 | 1657 |
| us-gov-west-1 | 0.172 | 194 |
| us-west-1 | 0.117 | 3448 |
| us-west-2 | 0.169 | 156 |

