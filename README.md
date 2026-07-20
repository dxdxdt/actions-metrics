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
Updated: 2026-07-20T19:28:08.882216+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.854 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.721 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.225 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.512 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.424 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.642 |  |
| me-central-1 | 0.890 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.593 |  |
| us-east-1 | 0.148 | 4890 |
| us-east-2 | 0.177 | 1657 |
| us-gov-east-1 | 0.164 | 1770 |
| us-gov-west-1 | 0.218 | 205 |
| us-west-1 | 0.159 | 3812 |
| us-west-2 | 0.218 | 167 |

