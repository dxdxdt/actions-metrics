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
Updated: 2025-10-19T14:10:25.501648+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.712 |  |
| ap-northeast-1 | 0.514 |  |
| ap-northeast-2 | 0.622 |  |
| ap-south-1 | 0.911 |  |
| ap-southeast-1 | 0.770 |  |
| ap-southeast-2 | 0.664 |  |
| ca-central-1 | 0.199 | 15 |
| eu-central-1 | 0.513 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.530 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.485 |  |
| me-south-1 | 0.826 |  |
| sa-east-1 | 0.631 |  |
| us-east-1 | 0.175 | 3328 |
| us-east-2 | 0.139 | 935 |
| us-gov-east-1 | 0.144 | 1097 |
| us-gov-west-1 | 0.171 | 53 |
| us-west-1 | 0.153 | 2242 |
| us-west-2 | 0.174 | 22 |

