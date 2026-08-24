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
Updated: 2026-08-24T06:40:01.203998+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.650 |  |
| ap-northeast-1 | 0.533 |  |
| ap-northeast-2 | 0.640 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.908 |  |
| ap-south-2 | 0.970 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.691 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.717 |  |
| ap-southeast-7 | 0.888 |  |
| ca-central-1 | 0.184 | 18 |
| ca-west-1 | 0.253 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.513 |  |
| eu-north-1 | 0.523 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.403 |  |
| eu-west-2 | 0.438 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.636 |  |
| me-central-1 | 0.858 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.607 |  |
| us-east-1 | 0.154 | 5051 |
| us-east-2 | 0.154 | 1682 |
| us-gov-east-1 | 0.134 | 1877 |
| us-gov-west-1 | 0.211 | 226 |
| us-west-1 | 0.149 | 4043 |
| us-west-2 | 0.209 | 185 |

