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
Updated: 2026-08-23T16:16:12.918395+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.648 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.470 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.497 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.725 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.779 |  |
| ap-southeast-4 | 0.696 |  |
| ap-southeast-5 | 0.747 |  |
| ap-southeast-6 | 0.673 |  |
| ap-southeast-7 | 0.825 |  |
| ca-central-1 | 0.253 | 18 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.533 |  |
| eu-central-2 | 0.561 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.565 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.492 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.698 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.213 | 5050 |
| us-east-2 | 0.208 | 1681 |
| us-gov-east-1 | 0.199 | 1872 |
| us-gov-west-1 | 0.138 | 226 |
| us-west-1 | 0.134 | 4038 |
| us-west-2 | 0.138 | 184 |

