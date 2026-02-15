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
Updated: 2026-02-15T01:27:08.340259+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.628 |  |
| ap-south-1 | 0.943 |  |
| ap-south-2 | 0.989 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.687 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.794 |  |
| ap-southeast-6 | 0.756 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.178 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.490 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.543 |  |
| eu-south-1 | 0.519 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.460 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.661 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.825 |  |
| mx-central-1 | 0.186 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.152 | 4122 |
| us-east-2 | 0.122 | 1341 |
| us-gov-east-1 | 0.120 | 1469 |
| us-gov-west-1 | 0.173 | 148 |
| us-west-1 | 0.191 | 3060 |
| us-west-2 | 0.172 | 125 |

