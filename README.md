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
Updated: 2026-05-02T18:45:55.962865+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.503 |  |
| ap-northeast-2 | 0.611 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.757 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.812 |  |
| ap-southeast-4 | 0.699 |  |
| ap-southeast-5 | 0.774 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.856 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.557 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.555 |  |
| eu-west-1 | 0.463 |  |
| eu-west-2 | 0.479 |  |
| eu-west-3 | 0.523 |  |
| il-central-1 | 0.689 |  |
| me-central-1 | 0.934 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.196 | 4586 |
| us-east-2 | 0.172 | 1558 |
| us-gov-east-1 | 0.183 | 1670 |
| us-gov-west-1 | 0.175 | 194 |
| us-west-1 | 0.124 | 3519 |
| us-west-2 | 0.169 | 157 |

