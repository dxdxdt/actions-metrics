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
Updated: 2026-06-26T18:24:51.198013+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.713 |  |
| ap-northeast-1 | 0.597 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.848 |  |
| ap-southeast-2 | 0.751 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.798 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.948 |  |
| ca-central-1 | 0.106 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.435 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.476 |  |
| eu-west-1 | 0.365 |  |
| eu-west-2 | 0.389 |  |
| eu-west-3 | 0.417 |  |
| il-central-1 | 0.583 |  |
| me-central-1 | 0.842 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.082 | 4790 |
| us-east-2 | 0.070 | 1641 |
| us-gov-east-1 | 0.069 | 1721 |
| us-gov-west-1 | 0.270 | 199 |
| us-west-1 | 0.211 | 3709 |
| us-west-2 | 0.271 | 163 |

