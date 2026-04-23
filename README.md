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
Updated: 2026-04-23T01:56:18.820637+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.719 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.713 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.850 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.874 |  |
| ap-southeast-6 | 0.807 |  |
| ap-southeast-7 | 0.974 |  |
| ca-central-1 | 0.144 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.449 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.394 |  |
| il-central-1 | 0.605 |  |
| me-central-1 | 0.781 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.088 | 4545 |
| us-east-2 | 0.106 | 1525 |
| us-gov-east-1 | 0.117 | 1661 |
| us-gov-west-1 | 0.287 | 194 |
| us-west-1 | 0.229 | 3462 |
| us-west-2 | 0.286 | 157 |

