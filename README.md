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
Updated: 2026-05-08T23:50:01.334321+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.036 |  |
| ap-east-1 | 0.665 |  |
| ap-east-2 | 0.603 |  |
| ap-northeast-1 | 0.486 |  |
| ap-northeast-2 | 0.592 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.913 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.647 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.233 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.447 |  |
| eu-west-2 | 0.501 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.704 |  |
| me-central-1 | 0.916 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.207 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.192 | 4612 |
| us-east-2 | 0.180 | 1576 |
| us-gov-east-1 | 0.167 | 1682 |
| us-gov-west-1 | 0.158 | 195 |
| us-west-1 | 0.109 | 3542 |
| us-west-2 | 0.154 | 157 |

