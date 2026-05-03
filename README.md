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
Updated: 2026-05-03T21:35:21.333475+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.538 |  |
| ap-northeast-2 | 0.641 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.851 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.894 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.516 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.523 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.429 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.657 |  |
| me-central-1 | 0.871 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.138 | 4591 |
| us-east-2 | 0.108 | 1563 |
| us-gov-east-1 | 0.115 | 1671 |
| us-gov-west-1 | 0.207 | 194 |
| us-west-1 | 0.156 | 3528 |
| us-west-2 | 0.205 | 157 |

