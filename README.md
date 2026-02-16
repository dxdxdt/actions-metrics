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
Updated: 2026-02-16T19:28:27.044440+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.996 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.647 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.809 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.721 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.763 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.208 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.500 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.534 |  |
| eu-south-2 | 0.543 |  |
| eu-west-1 | 0.421 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.479 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.857 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.619 |  |
| us-east-1 | 0.171 | 4132 |
| us-east-2 | 0.165 | 1348 |
| us-gov-east-1 | 0.166 | 1480 |
| us-gov-west-1 | 0.204 | 149 |
| us-west-1 | 0.160 | 3066 |
| us-west-2 | 0.207 | 126 |

