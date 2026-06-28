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
Updated: 2026-06-28T00:00:59.737082+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.855 |  |
| ap-east-1 | 0.840 |  |
| ap-east-2 | 0.774 |  |
| ap-northeast-1 | 0.662 |  |
| ap-northeast-2 | 0.744 |  |
| ap-northeast-3 | 0.669 |  |
| ap-south-1 | 0.812 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.895 |  |
| ap-southeast-2 | 0.801 |  |
| ap-southeast-3 | 0.952 |  |
| ap-southeast-4 | 0.847 |  |
| ap-southeast-5 | 0.915 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.996 |  |
| ca-central-1 | 0.085 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.376 |  |
| eu-central-2 | 0.394 |  |
| eu-north-1 | 0.426 |  |
| eu-south-1 | 0.407 |  |
| eu-south-2 | 0.410 |  |
| eu-west-1 | 0.293 |  |
| eu-west-2 | 0.323 |  |
| eu-west-3 | 0.352 |  |
| il-central-1 | 0.532 |  |
| me-central-1 | 0.734 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.476 |  |
| us-east-1 | 0.040 | 4796 |
| us-east-2 | 0.083 | 1644 |
| us-gov-east-1 | 0.084 | 1723 |
| us-gov-west-1 | 0.323 | 199 |
| us-west-1 | 0.269 | 3713 |
| us-west-2 | 0.322 | 163 |

