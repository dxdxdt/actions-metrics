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
Updated: 2026-04-02T08:01:08.154613+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.029 |  |
| ap-east-1 | 0.678 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.502 |  |
| ap-northeast-2 | 0.608 |  |
| ap-northeast-3 | 0.526 |  |
| ap-south-1 | 0.965 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.817 |  |
| ap-southeast-4 | 0.692 |  |
| ap-southeast-5 | 0.772 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.855 |  |
| ca-central-1 | 0.227 | 16 |
| ca-west-1 | 0.312 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.575 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.498 |  |
| eu-west-3 | 0.520 |  |
| il-central-1 | 0.709 |  |
| me-central-1 | 0.907 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.195 | 4418 |
| us-east-2 | 0.187 | 1472 |
| us-gov-east-1 | 0.156 | 1620 |
| us-gov-west-1 | 0.170 | 190 |
| us-west-1 | 0.114 | 3335 |
| us-west-2 | 0.167 | 153 |

