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
Updated: 2026-03-09T23:21:16.559255+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.553 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.694 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.729 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.209 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.550 |  |
| eu-south-1 | 0.513 |  |
| eu-south-2 | 0.531 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.449 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.671 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.834 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.588 |  |
| us-east-1 | 0.152 | 4251 |
| us-east-2 | 0.168 | 1412 |
| us-gov-east-1 | 0.165 | 1549 |
| us-gov-west-1 | 0.218 | 176 |
| us-west-1 | 0.156 | 3205 |
| us-west-2 | 0.213 | 144 |

