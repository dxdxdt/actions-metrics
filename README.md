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
Updated: 2026-04-08T23:32:14.250154+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.885 |  |
| ap-east-1 | 0.797 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.729 |  |
| ap-northeast-3 | 0.653 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.889 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.843 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.868 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.301 |  |
| eu-central-1 | 0.389 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.370 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.776 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.068 | 4461 |
| us-east-2 | 0.101 | 1489 |
| us-gov-east-1 | 0.108 | 1634 |
| us-gov-west-1 | 0.321 | 192 |
| us-west-1 | 0.254 | 3381 |
| us-west-2 | 0.307 | 154 |

