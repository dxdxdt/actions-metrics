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
Updated: 2026-03-09T16:51:00.322533+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.907 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.624 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.925 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.829 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.841 |  |
| ap-southeast-7 | 0.957 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.423 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.458 |  |
| eu-west-1 | 0.351 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.771 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.527 |  |
| us-east-1 | 0.075 | 4249 |
| us-east-2 | 0.085 | 1412 |
| us-gov-east-1 | 0.083 | 1548 |
| us-gov-west-1 | 0.264 | 176 |
| us-west-1 | 0.247 | 3201 |
| us-west-2 | 0.262 | 144 |

