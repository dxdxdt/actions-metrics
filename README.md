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
Updated: 2026-04-05T14:29:50.971377+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.707 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.635 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.783 |  |
| ap-southeast-2 | 0.689 |  |
| ap-southeast-3 | 0.837 |  |
| ap-southeast-4 | 0.730 |  |
| ap-southeast-5 | 0.800 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.219 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.495 |  |
| eu-central-2 | 0.500 |  |
| eu-north-1 | 0.537 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.415 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.459 |  |
| il-central-1 | 0.649 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.152 | 4440 |
| us-east-2 | 0.160 | 1483 |
| us-gov-east-1 | 0.164 | 1628 |
| us-gov-west-1 | 0.211 | 191 |
| us-west-1 | 0.161 | 3359 |
| us-west-2 | 0.214 | 153 |

