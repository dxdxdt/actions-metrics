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
Updated: 2026-11-21T11:56:12.237520+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.680 |  |
| ap-east-1 | 0.568 |  |
| ap-east-2 | 0.521 |  |
| ap-northeast-1 | 0.433 |  |
| ap-northeast-2 | 0.509 |  |
| ap-northeast-3 | 0.451 |  |
| ap-south-1 | 0.645 |  |
| ap-south-2 | 0.678 |  |
| ap-southeast-1 | 0.629 |  |
| ap-southeast-2 | 0.550 |  |
| ap-southeast-3 | 0.676 |  |
| ap-southeast-4 | 0.612 |  |
| ap-southeast-5 | 0.642 |  |
| ap-southeast-6 | 0.573 |  |
| ap-southeast-7 | 0.703 |  |
| ca-central-1 | 0.108 | 18 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.330 |  |
| eu-central-2 | 0.348 |  |
| eu-north-1 | 0.371 |  |
| eu-south-1 | 0.348 |  |
| eu-south-2 | 0.342 |  |
| eu-west-1 | 0.271 |  |
| eu-west-2 | 0.298 |  |
| eu-west-3 | 0.318 |  |
| il-central-1 | 0.453 |  |
| me-central-1 | 0.607 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.645 |  |
| mx-central-1 | 0.214 |  |
| sa-east-1 | 0.406 |  |
| us-east-1 | 0.074 | 5193 |
| us-east-2 | 0.106 | 1730 |
| us-gov-east-1 | 0.100 | 1964 |
| us-gov-west-1 | 0.194 | 248 |
| us-west-1 | 0.156 | 4221 |
| us-west-2 | 0.196 | 199 |

