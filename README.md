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
Updated: 2026-09-22T00:27:08.536819+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.985 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.649 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.628 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.965 |  |
| ap-southeast-1 | 0.818 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.917 |  |
| ca-central-1 | 0.181 | 18 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.522 |  |
| eu-south-2 | 0.532 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.670 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.182 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.149 | 5111 |
| us-east-2 | 0.153 | 1686 |
| us-gov-east-1 | 0.131 | 1924 |
| us-gov-west-1 | 0.200 | 234 |
| us-west-1 | 0.141 | 4132 |
| us-west-2 | 0.198 | 192 |

