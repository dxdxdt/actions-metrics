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
Updated: 2026-06-14T00:01:19.628877+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.863 |  |
| ap-east-1 | 0.827 |  |
| ap-east-2 | 0.770 |  |
| ap-northeast-1 | 0.647 |  |
| ap-northeast-2 | 0.756 |  |
| ap-northeast-3 | 0.669 |  |
| ap-south-1 | 0.802 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.901 |  |
| ap-southeast-2 | 0.794 |  |
| ap-southeast-3 | 0.954 |  |
| ap-southeast-4 | 0.847 |  |
| ap-southeast-5 | 0.924 |  |
| ap-southeast-6 | 0.837 |  |
| ap-southeast-7 | 1.006 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.277 |  |
| eu-central-1 | 0.373 |  |
| eu-central-2 | 0.400 |  |
| eu-north-1 | 0.422 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.405 |  |
| eu-west-1 | 0.287 |  |
| eu-west-2 | 0.325 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.532 |  |
| me-central-1 | 0.730 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.471 |  |
| us-east-1 | 0.044 | 4756 |
| us-east-2 | 0.088 | 1633 |
| us-gov-east-1 | 0.086 | 1712 |
| us-gov-west-1 | 0.325 | 198 |
| us-west-1 | 0.272 | 3661 |
| us-west-2 | 0.325 | 163 |

