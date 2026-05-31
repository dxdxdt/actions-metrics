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
Updated: 2026-05-31T02:42:33.537730+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.890 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.629 |  |
| ap-northeast-2 | 0.746 |  |
| ap-northeast-3 | 0.664 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.882 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.777 |  |
| ap-southeast-3 | 0.931 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.812 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.395 |  |
| eu-central-2 | 0.417 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.430 |  |
| eu-west-1 | 0.313 |  |
| eu-west-2 | 0.351 |  |
| eu-west-3 | 0.373 |  |
| il-central-1 | 0.549 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.062 | 4704 |
| us-east-2 | 0.084 | 1616 |
| us-gov-east-1 | 0.085 | 1708 |
| us-gov-west-1 | 0.302 | 195 |
| us-west-1 | 0.243 | 3623 |
| us-west-2 | 0.304 | 161 |

