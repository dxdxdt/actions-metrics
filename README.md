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
Updated: 2026-03-25T22:28:21.684083+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.989 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.523 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.781 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.729 |  |
| ap-southeast-5 | 0.797 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.185 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.435 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.480 |  |
| il-central-1 | 0.676 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.839 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.617 |  |
| us-east-1 | 0.158 | 4358 |
| us-east-2 | 0.137 | 1455 |
| us-gov-east-1 | 0.134 | 1604 |
| us-gov-west-1 | 0.198 | 190 |
| us-west-1 | 0.153 | 3298 |
| us-west-2 | 0.200 | 151 |

