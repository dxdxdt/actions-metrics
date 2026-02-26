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
Updated: 2026-02-26T01:20:40.667429+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.005 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.624 |  |
| ap-northeast-1 | 0.507 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.969 |  |
| ap-southeast-1 | 0.763 |  |
| ap-southeast-2 | 0.663 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.763 |  |
| ap-southeast-7 | 0.865 |  |
| ca-central-1 | 0.214 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.437 |  |
| eu-west-2 | 0.478 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.884 |  |
| me-south-1 | 0.854 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.638 |  |
| us-east-1 | 0.170 | 4183 |
| us-east-2 | 0.161 | 1380 |
| us-gov-east-1 | 0.145 | 1510 |
| us-gov-west-1 | 0.165 | 162 |
| us-west-1 | 0.164 | 3120 |
| us-west-2 | 0.158 | 132 |

