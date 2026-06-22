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
Updated: 2026-06-22T02:56:44.891531+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.866 |  |
| ap-east-1 | 0.827 |  |
| ap-east-2 | 0.772 |  |
| ap-northeast-1 | 0.656 |  |
| ap-northeast-2 | 0.761 |  |
| ap-northeast-3 | 0.672 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.899 |  |
| ap-southeast-2 | 0.775 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.821 |  |
| ap-southeast-5 | 0.928 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 1.004 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.387 |  |
| eu-central-2 | 0.411 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.423 |  |
| eu-south-2 | 0.422 |  |
| eu-west-1 | 0.307 |  |
| eu-west-2 | 0.343 |  |
| eu-west-3 | 0.364 |  |
| il-central-1 | 0.543 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.062 | 4784 |
| us-east-2 | 0.116 | 1636 |
| us-gov-east-1 | 0.119 | 1716 |
| us-gov-west-1 | 0.311 | 198 |
| us-west-1 | 0.248 | 3690 |
| us-west-2 | 0.311 | 163 |

