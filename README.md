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
Updated: 2026-03-25T14:14:48.916968+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.706 |  |
| ap-northeast-3 | 0.619 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.937 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.808 |  |
| ap-southeast-5 | 0.874 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.380 |  |
| eu-west-3 | 0.400 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.758 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.075 | 4358 |
| us-east-2 | 0.077 | 1452 |
| us-gov-east-1 | 0.076 | 1603 |
| us-gov-west-1 | 0.285 | 190 |
| us-west-1 | 0.243 | 3295 |
| us-west-2 | 0.280 | 151 |

