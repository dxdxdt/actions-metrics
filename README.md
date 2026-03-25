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
Updated: 2026-03-25T06:56:20.295264+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.707 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.687 |  |
| ap-northeast-3 | 0.604 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.752 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.936 |  |
| ca-central-1 | 0.149 | 16 |
| ca-west-1 | 0.316 |  |
| eu-central-1 | 0.441 |  |
| eu-central-2 | 0.460 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.471 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.617 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.772 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.106 | 4355 |
| us-east-2 | 0.100 | 1451 |
| us-gov-east-1 | 0.114 | 1601 |
| us-gov-west-1 | 0.255 | 190 |
| us-west-1 | 0.219 | 3294 |
| us-west-2 | 0.266 | 151 |

