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
Updated: 2026-03-30T14:27:56.602181+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.656 |  |
| ap-northeast-1 | 0.544 |  |
| ap-northeast-2 | 0.648 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.855 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.237 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.534 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.787 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.128 | 4398 |
| us-east-2 | 0.116 | 1467 |
| us-gov-east-1 | 0.122 | 1615 |
| us-gov-west-1 | 0.231 | 190 |
| us-west-1 | 0.171 | 3321 |
| us-west-2 | 0.226 | 152 |

