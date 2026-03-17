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
Updated: 2026-03-17T07:50:53.655465+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.770 |  |
| ap-east-2 | 0.703 |  |
| ap-northeast-1 | 0.581 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.930 |  |
| ap-south-2 | 0.989 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.827 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.436 |  |
| eu-central-2 | 0.459 |  |
| eu-north-1 | 0.495 |  |
| eu-south-1 | 0.465 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.418 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.810 |  |
| me-south-1 | 0.773 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.093 | 4296 |
| us-east-2 | 0.089 | 1430 |
| us-gov-east-1 | 0.090 | 1580 |
| us-gov-west-1 | 0.243 | 186 |
| us-west-1 | 0.240 | 3244 |
| us-west-2 | 0.249 | 148 |

